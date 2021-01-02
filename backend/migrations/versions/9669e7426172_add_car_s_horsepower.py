"""Add Car's Horsepower

Revision ID: 9669e7426172
Revises: 
Create Date: 2021-01-02 16:01:28.218425

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9669e7426172'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.add_column('Car', sa.Column('Horsepower', sa.INTEGER))


def downgrade():
    op.drop_column('Car', 'Horsepower')

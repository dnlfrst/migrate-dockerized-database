"""Add Car's Horse Power

Revision ID: 9feec6f6f0c4
Revises: 
Create Date: 2020-12-27 14:34:41.293458

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9feec6f6f0c4'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.add_column('Car', sa.Column('Horse Power', sa.INTEGER))


def downgrade():
    op.drop_column('Car', 'Horse Power')
